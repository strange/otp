%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2011-2012. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
%%

-module(ssh_key_api).

-include_lib("public_key/include/public_key.hrl"). 
-include("ssh.hrl").

-type ssh_algorithm() :: string().
-type file_error()    :: file:posix() | badarg | system_limit | terminated.

-callback host_key(Algorithm :: ssh_algorithm(), Options :: list()) -> 
                      {ok, [{public_key(), Attributes::list()}]} | public_key()
                          | {error, string()}.

-callback user_key(Algorithm :: ssh_algorithm(), Options :: list()) -> 
                     {ok, [{public_key(), Attributes::list()}]} | public_key()
                          | {error, string()}.

-callback is_host_key(Key :: public_key(), PeerName :: string(), 
                  Algorithm :: ssh_algorithm(), Options :: list()) ->
                         boolean().

-callback add_host_key(Host :: string(), Key :: public_key(), Options :: list()) ->
                          ok | {error, file_error()}.

-callback is_auth_key(Key :: public_key(), User :: string(),
                  Algorithm :: ssh_algorithm(), Options :: list()) ->
                         boolean().

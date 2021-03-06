%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2008-2012. All Rights Reserved.
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
%% This file is generated DO NOT EDIT

%% @doc See external documentation: <a href="http://www.wxwidgets.org/manuals/stable/wx_wxtextdataobject.html">wxTextDataObject</a>.
%% <p>This class is derived (and can use functions) from:
%% <br />{@link wxDataObject}
%% </p>
%% @type wxTextDataObject().  An object reference, The representation is internal
%% and can be changed without notice. It can't be used for comparsion
%% stored on disc or distributed for use on other nodes.

-module(wxTextDataObject).
-include("wxe.hrl").
-export([destroy/1,getText/1,getTextLength/1,new/0,new/1,setText/2]).

%% inherited exports
-export([parent_class/1]).

-export_type([wxTextDataObject/0]).
%% @hidden
parent_class(wxDataObject) -> true;
parent_class(_Class) -> erlang:error({badtype, ?MODULE}).

-type wxTextDataObject() :: wx:wx_object().
%% @equiv new([])
-spec new() -> wxTextDataObject().

new() ->
  new([]).

%% @doc See <a href="http://www.wxwidgets.org/manuals/stable/wx_wxtextdataobject.html#wxtextdataobjectwxtextdataobject">external documentation</a>.
-spec new([Option]) -> wxTextDataObject() when
	Option :: {text, unicode:chardata()}.
new(Options)
 when is_list(Options) ->
  MOpts = fun({text, Text}, Acc) ->   Text_UC = unicode:characters_to_binary([Text,0]),[<<1:32/?UI,(byte_size(Text_UC)):32/?UI,(Text_UC)/binary, 0:(((8- ((0+byte_size(Text_UC)) band 16#7)) band 16#7))/unit:8>>|Acc];
          (BadOpt, _) -> erlang:error({badoption, BadOpt}) end,
  BinOpt = list_to_binary(lists:foldl(MOpts, [<<0:32>>], Options)),
  wxe_util:construct(?wxTextDataObject_new,
  <<BinOpt/binary>>).

%% @doc See <a href="http://www.wxwidgets.org/manuals/stable/wx_wxtextdataobject.html#wxtextdataobjectgettextlength">external documentation</a>.
-spec getTextLength(This) -> integer() when
	This::wxTextDataObject().
getTextLength(#wx_ref{type=ThisT,ref=ThisRef}) ->
  ?CLASS(ThisT,wxTextDataObject),
  wxe_util:call(?wxTextDataObject_GetTextLength,
  <<ThisRef:32/?UI>>).

%% @doc See <a href="http://www.wxwidgets.org/manuals/stable/wx_wxtextdataobject.html#wxtextdataobjectgettext">external documentation</a>.
-spec getText(This) -> unicode:charlist() when
	This::wxTextDataObject().
getText(#wx_ref{type=ThisT,ref=ThisRef}) ->
  ?CLASS(ThisT,wxTextDataObject),
  wxe_util:call(?wxTextDataObject_GetText,
  <<ThisRef:32/?UI>>).

%% @doc See <a href="http://www.wxwidgets.org/manuals/stable/wx_wxtextdataobject.html#wxtextdataobjectsettext">external documentation</a>.
-spec setText(This, Text) -> ok when
	This::wxTextDataObject(), Text::unicode:chardata().
setText(#wx_ref{type=ThisT,ref=ThisRef},Text)
 when is_list(Text) ->
  ?CLASS(ThisT,wxTextDataObject),
  Text_UC = unicode:characters_to_binary([Text,0]),
  wxe_util:cast(?wxTextDataObject_SetText,
  <<ThisRef:32/?UI,(byte_size(Text_UC)):32/?UI,(Text_UC)/binary, 0:(((8- ((0+byte_size(Text_UC)) band 16#7)) band 16#7))/unit:8>>).

%% @doc Destroys this object, do not use object again
-spec destroy(This::wxTextDataObject()) -> ok.
destroy(Obj=#wx_ref{type=Type}) ->
  ?CLASS(Type,wxTextDataObject),
  wxe_util:destroy(?wxTextDataObject_destroy,Obj),
  ok.
 %% From wxDataObject

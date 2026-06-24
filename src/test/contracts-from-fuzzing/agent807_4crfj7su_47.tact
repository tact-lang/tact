// test optional wrapping message struct (allowed)
message(401) SmallMsg {}

contract OptWrapMsg {
    msgOpt: SmallMsg? = null;
}
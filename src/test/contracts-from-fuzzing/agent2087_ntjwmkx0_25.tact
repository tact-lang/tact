struct EmbeddedSet {
    intf: Int;
    boolf: Bool;
    strf: String;
}

contract CompositeDefaults {
    e: EmbeddedSet = EmbeddedSet{intf:42,boolf:true,strf:"magic"};
}
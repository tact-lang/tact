struct NestedOptionDef {
    nested:InnerOptDef?=null;
}

struct InnerOptDef {
    x:Int?=null;
    y:Bool?=null;
}

contract Test {
    no:NestedOptionDef=NestedOptionDef{};
}
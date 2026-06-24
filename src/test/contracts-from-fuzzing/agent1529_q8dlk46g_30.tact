// purposely mix optional struct and nesting
struct Sub {
    name : String;
}
struct OuterOpt {
    val : Sub?;
}

contract NestedOptStruct {
    data : OuterOpt;
    init(){
        self.data = OuterOpt{ val : null };
    }
}
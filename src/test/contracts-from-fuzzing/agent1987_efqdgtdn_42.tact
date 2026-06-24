struct HasBool {
    flag:Bool;
}

struct OuterBool {
    inner:HasBool;
}

contract NestedBool {
    v:OuterBool;
    init(){
        self.v = OuterBool{
            inner: HasBool{flag:true}
        };
    }
}
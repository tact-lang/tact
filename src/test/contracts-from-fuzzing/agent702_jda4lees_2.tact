struct Inner {
    val: Int;
}

contract TestOptStruct {
    innerOpt: Inner?;
    
    init() {
        // no explicit assignment to innerOpt
    }
}
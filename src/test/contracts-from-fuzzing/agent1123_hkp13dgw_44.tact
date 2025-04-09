contract NestedStructOpt {
    field: Inner?;
    
    init() {
        self.field = null;
    }
}

struct Inner {
    val: Int;
}
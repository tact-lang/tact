message Inner {
    val: Int?;
}

message Outer {
    inner: Inner?;
}

contract TestContract {
    m: Outer;

    init() {
        self.m = Outer{inner: null};
    }
}
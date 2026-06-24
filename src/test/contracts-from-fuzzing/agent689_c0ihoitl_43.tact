struct Test {
    opt: Int? as uint32;
}

contract MinimalOptIntSerialization {
    val: Test;

    init() {
        self.val = Test{ opt: null };
    }
}
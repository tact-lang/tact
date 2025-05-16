// optional persistent struct inside persistent optional
struct InnerData {
    val: Int;
    flag: Bool;
}

contract OptionalNested {
    data: InnerData?;

    init() {
        self.data = null;
    }
}

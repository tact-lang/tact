struct DeepOptionalsA { i: Int? }
struct DeepOptionalsB { a: DeepOptionalsA? }
struct DeepOptionalsC { b: DeepOptionalsB? }

contract NestedNulls {
    val: DeepOptionalsC;
    init() {
        self.val = DeepOptionalsC{
            b: null
        };
    }
    receive() {}
}
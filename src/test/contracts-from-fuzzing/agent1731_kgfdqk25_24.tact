struct RecA {
    next: RecB?;
}
struct RecB {
    next: RecC?;
}
struct RecC {
    val: Int;
}

contract DeepOptions {
    list: RecA?;

    init() {
        self.list = RecA{
            next: RecB{
                next: RecC{
                    val: 77
                }
            }
        };
    }
}

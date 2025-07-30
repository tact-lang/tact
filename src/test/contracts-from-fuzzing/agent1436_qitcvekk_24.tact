struct Layer3 {
    s: String;
    n: Int;
}
struct Layer2 {
    l3: Layer3;
    flag: Bool;
}
struct Layer1 {
    l2: Layer2;
    text: String;
}
contract TestContract {
    top: Layer1;

    init() {
        self.top = Layer1{
            l2: Layer2{
                l3: Layer3{ s: "deep", n: 99 },
                flag: true
            },
            text: "root"
        };
    }
}

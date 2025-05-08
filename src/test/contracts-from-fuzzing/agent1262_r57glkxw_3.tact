struct Composite {
    x: Int;
    y: Int;
    text: String;
    flag: Bool;
} 

contract LargeCompositeTest {
    c: Composite;

    init() {
        self.c = Composite{
            x: 10,
            y: 20,
            text: "hello",
            flag: true,
        };
    }
}
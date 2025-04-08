struct Flat {
    x: Int;
    y: Bool;
    z: String;
}

contract FlatTest {
    f: Flat = Flat{ x: 1, y: true, z: "hi" };

    receive() {
        self.f = Flat{ x: 2, y: false, z: "bye" };
    }
}
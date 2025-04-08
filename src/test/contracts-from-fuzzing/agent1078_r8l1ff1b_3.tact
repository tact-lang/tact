struct Inner { data: Int; flag: Bool; }
struct Outer { nested: Inner; description: String; }

contract NestTest {
    info: Outer;

    init() {
        self.info = Outer{ nested: Inner{ data: 7, flag: true }, description: "desc" };
    }
}
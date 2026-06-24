struct DeepOptions {
    opt1: Int?;
    nest1: Nest1?;
}

struct Nest1 {
    opt2: Bool?;
    nest2: Nest2?;
}

struct Nest2 {
    opt3: Address?;
}

contract DeepOptionStructTest {
    data: DeepOptions;

    init() {
        self.data = DeepOptions{
            opt1: null,
            nest1: null
        };
    }
}
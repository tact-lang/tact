struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Wrapper {
    some: OptStruct?;
}

contract CTest {
    w: Wrapper;

    init() {
        self.w = Wrapper{ some: null };
    }
}
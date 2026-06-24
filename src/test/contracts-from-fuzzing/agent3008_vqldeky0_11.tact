struct PointOption {
    x: Int?;
    y: Int?;
}

struct Wrapper {
    pOpt: PointOption?;
    label: String;
}

contract WrapperTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            pOpt: null,
            label: "text",
        };
    }
}
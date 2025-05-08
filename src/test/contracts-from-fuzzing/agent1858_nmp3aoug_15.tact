struct OptSerialize {
    a: Int? as int32;
    b: Bool?;
    c: String?;
}

contract OptSerTest {
    data: OptSerialize;
    init() {
        self.data = OptSerialize{
            a: null,
            b: true,
            c: null
        };
    }
}
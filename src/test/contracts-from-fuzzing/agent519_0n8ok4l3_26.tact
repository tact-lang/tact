struct NullableCombo {
    ia: Int?;
    ba: Bool?;
    sa: String?;
    aa: Address?;
}

struct Wrapper {
    nc: NullableCombo;
    x: Int;
}

contract OptionalWrapperTest {
    data: Wrapper;

    init() {
        self.data = Wrapper {
            nc: NullableCombo{ ia:null, ba:null, sa:null, aa:null },
            x: 5
        };
    }
}
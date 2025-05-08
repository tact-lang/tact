struct OptParams {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: String?;
}

contract OptFieldsTest {
    params: OptParams;

    init() {
        self.params = OptParams{
            o1:null,
            o2:true,
            o3:null,
            o4:emptyCell(),
            o5:null
        };
    }
}

struct SimpleOpt { foo: Int?; }

contract PunningTest {
    data: SimpleOpt;

    init() {
        let foo: Int? = 5;
        self.data = SimpleOpt{ foo };
    }
}
struct DefaultOptTest {
    optionalInt: Int?; 
    someInt: Int = 123;
}

contract OptDefaultContract {
    testField: DefaultOptTest;

    init() {
        self.testField = DefaultOptTest{
            someInt: 999,
            optionalInt: null,
        };
    }
}
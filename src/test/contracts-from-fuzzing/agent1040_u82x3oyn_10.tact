struct WithLongStringDefault {
    description: String = "This is a very long string used as a default value to test the compiler's handling of lengthy inline string defaults in storage structs.";
    amount: Int;
}

contract LongStringDefaultTest {
    data: WithLongStringDefault;

    init() {
        self.data = WithLongStringDefault{
            amount: 42
        };
    }
}
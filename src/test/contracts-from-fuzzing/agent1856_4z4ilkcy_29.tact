struct EmptyStringContainer {
    s: String;
}

contract EmptyStringTest {
    val: EmptyStringContainer;

    init() {
        self.val = EmptyStringContainer{
            s: ""
        };
    }
}
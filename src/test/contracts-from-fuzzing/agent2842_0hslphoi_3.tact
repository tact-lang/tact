struct OneFieldOptional {
    v: Int?;
}

contract OptFieldTest {
    val: OneFieldOptional;

    init() {
        self.val = OneFieldOptional{
            v: null
        };
    }
}
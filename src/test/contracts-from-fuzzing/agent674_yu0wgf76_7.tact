struct DefaultVsNull {
    a: Int = 5;
    b: Int?; // null default by implicit
    c: Bool = true;
    d: Bool?;
}

contract TestContract {
    val: DefaultVsNull;

    init() {
        self.val = DefaultVsNull{
            // skip all fields to test defaults/nulls
        };
    }
}
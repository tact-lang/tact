// contract with defaulted persistent storage complex struct containing optionals
struct Param {
    name: String = "def";
    count: Int?;
    note: String?;
}

contract DefaultStructInit {
    p: Param;

    init() {
        self.p = Param{
            // name omitted so default applies
            count: null,
            note: null
        };
    }
}
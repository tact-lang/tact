// optional nested struct with defaulted fields inside
struct Phone {
    number: String;
    ext: Int?;
}

struct Directory {
    phone: Phone?;
}

contract Test {
    d: Directory;

    init() {
        self.d = Directory{
            phone: Phone{
                number: "123",
                ext: null
            }
        };
    }
}
struct Deep {
    number: Int;
}

struct Complex {
    val1: Int?;
    val2: Bool?;
    val3: Deep?;
    val4: String?;
}

contract TestContract {
    data: Complex = Complex{
        val1: null,
        val2: true,
        val3: Deep{ number: 7 },
        val4: null,
    };

    init() {
        self.data = Complex{
            val1: 100,
            val2: false,
            val3: null,
            val4: "hello",
        };
    }
}
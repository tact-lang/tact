struct Complex1 {
    a: Int?;
    b: String;
}
struct Complex2 {
    x: Complex1?;
    y: Int;
    z: String?;
}
contract NestOptStruct {
    data: Complex2;

    init() {
        self.data = Complex2{
            x: Complex1{ a: null, b: "hi" },
            y: 777,
            z: null
        };
    }
}

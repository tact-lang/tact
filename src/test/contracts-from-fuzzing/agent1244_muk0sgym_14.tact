struct Info { a: Int; }
struct Flag { b: Bool; }
struct Text { s: String; }

contract MultipleStructVars {
    info: Info;
    flag: Flag;
    text: Text;

    init() {
        self.info = Info{ a: 123 };
        self.flag = Flag{ b: true };
        self.text = Text{ s: "xyz" };
    }
}

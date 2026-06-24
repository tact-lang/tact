struct ABool { a: Bool }
struct AOpt { opt: ABool? }

contract BoolOpt {
    val: AOpt;

    init() {
        self.val = AOpt{ opt: ABool{ a: true } };
    }
}
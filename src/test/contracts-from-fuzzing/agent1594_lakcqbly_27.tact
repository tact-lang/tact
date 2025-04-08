struct Sopt1 { f: Int?; }
struct Sopt2 { s: Sopt1?; }
struct Sopt3 { t: Sopt2?; }

contract NestOpt {
    val: Sopt3;
    init() {
        self.val = Sopt3{ t: null };
    }
}
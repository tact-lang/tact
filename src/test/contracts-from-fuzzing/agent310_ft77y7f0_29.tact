struct Opt1 { next: Opt2? }
struct Opt2 { next: Opt3? }
struct Opt3 { next: Opt4? }
struct Opt4 { next: Opt5? }
struct Opt5 { val: Int }

contract TestContract {
    val: Opt1?;

    init() {
        self.val = null;
    }
}

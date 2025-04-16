// deeply nested optional struct chain as field
struct A1 { next: A2?; val: Int?; }
struct A2 { next: A3?; val: Int?; }
struct A3 { next: A4?; val: Int?; }
struct A4 { val: Int?; }

contract LongChain {
    top: A1?;

    init() {
        self.top = null;
    }
}
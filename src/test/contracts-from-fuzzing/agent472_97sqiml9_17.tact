struct SVal { count: Int; label: String; }

contract Arranged {
    first: SVal;
    second: Int;
    third: SVal;

    init() {
        self.first = SVal{ count:10, label:"a" };
        self.second = 20;
        self.third = SVal{ count:30, label:"b" };
    }
}
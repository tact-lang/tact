struct S4 { val: Int; }
struct S3 { next: S4; }
struct S2 { next: S3; }
struct S1 { next: S2; }

contract TestContract {
    deep: S1 = S1{ next: S2{ next: S3{ next: S4{ val: 99 } } } };

    init() {}

    receive() {
        dump(self.deep.next.next.next.val);
    }
}
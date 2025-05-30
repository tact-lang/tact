struct S1 { value: Int }
struct S2 { value: S1 }
struct S3 { value: S2 }
struct S4 { value: S3 }
struct S5 { value: S4 }
struct S6 { value: S5 }

contract TestContract {
    deeply: S6;

    init() {
        self.deeply = S6{ value: S5{ value: S4{ value: S3{ value: S2{ value: S1{value:42}}}}}};
    }
}
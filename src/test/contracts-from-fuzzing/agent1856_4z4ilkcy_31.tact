struct S1 { x: Int }
struct S2 { v: S1 }
struct S3 { v: S2 }
struct S4 { v: S3 }
struct S5 { v: S4 }
struct S6 { v: S5 }
struct S7 { v: S6 }

contract DeepSeven {
    data: S7;

    init() {
        self.data = S7{ v: S6{ v: S5{ v: S4{ v: S3{ v: S2{ v: S1{ x: 3 }}}}}}};
    }
}

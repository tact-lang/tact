struct SDepth1 { x: Int; }
struct SDepth2 { next: SDepth1; }
struct SDepth3 { next: SDepth2; }
struct SDepth4 { next: SDepth3; }
struct SDepth5 { next: SDepth4; }
struct SDepth6 { next: SDepth5; }
struct SDepth7 { next: SDepth6; }
struct SDepth8 { next: SDepth7; }

contract Deepest {
    d: SDepth8;

    init() {
        self.d = SDepth8{ next: SDepth7{ next: SDepth6{ next: SDepth5{
            next: SDepth4{ next: SDepth3{ next: SDepth2{ next: SDepth1{ x: 123 } } } } } } } };
    }
}

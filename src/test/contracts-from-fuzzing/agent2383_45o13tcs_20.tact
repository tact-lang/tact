struct Deep1 { value: Int; }
struct Deep2 { deep1: Deep1; }
struct Deep3 { deep2: Deep2; }
struct Deep4 { deep3: Deep3; }
struct Deep5 { deep4: Deep4; }
struct Deep6 { deep5: Deep5; }
struct Deep7 { deep6: Deep6; }
struct Deep8 { deep7: Deep7; }
struct Deep9 { deep8: Deep8; }

contract Level9 {
    d: Deep9;
    init() {
        self.d = Deep9{ deep8: Deep8{ deep7: Deep7{ deep6: Deep6{ deep5: Deep5{ deep4: Deep4{ deep3: Deep3{ deep2: Deep2{ deep1: Deep1{ value: 1 } } } } } } } } };
    }
}
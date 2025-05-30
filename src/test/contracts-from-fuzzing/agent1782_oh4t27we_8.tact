struct Str1 { x: Int }
struct Str2 { y: Str1 }
struct Str3 { z: Str2 }
struct Str4 { w: Str3 }
struct Str5 { v: Str4 }

contract DeepFive {
    val: Str5;

    init() {
        self.val = Str5{ v: Str4{ w: Str3{ z: Str2{ y: Str1{ x: 777 } } } } };
    }
}
// Deep nested mixture, many levels deep with options and defaults
struct Lev5 { val: Int? = null; }
struct Lev4 { lev5: Lev5? = null; }
struct Lev3 { lev4: Lev4? = null; }
struct Lev2 { lev3: Lev3? = null; }
struct Lev1 { lev2: Lev2? = null; }

contract MixDeepDefaultOpt {
    data: Lev1;

    init() {
        self.data = Lev1{};
    }
}
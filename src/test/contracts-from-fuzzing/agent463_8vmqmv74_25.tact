struct NestedOptions {
    email: String?;
    account: Address?;
}

struct UserComplex {
    uid: Int;
    info: NestedOptions;
}

contract ComplexOptContract {
    user: UserComplex;

    init() {
        self.user = UserComplex{
            uid: 42,
            info: NestedOptions{ email: null, account: null }
        };
    }
}
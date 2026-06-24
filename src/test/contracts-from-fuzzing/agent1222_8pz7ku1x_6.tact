struct Social {
    twitter: String?;
    telegram: String?;
}

struct Profile {
    nickname: String = "anon";
    social: Social?; // optional nested struct
}

contract TestContract {
    user: Profile;

    init() {
        self.user = Profile{
            nickname: "bob",
            social: Social{
                twitter: null,
                telegram: "@bobTG",
            },
        };
    }

    receive() {
        let nick = self.user.nickname;
        let soc = self.user.social;
        if (soc != null) {
            let tw = soc!!.twitter;
            let tg = soc!!.telegram;
        }
    }
}
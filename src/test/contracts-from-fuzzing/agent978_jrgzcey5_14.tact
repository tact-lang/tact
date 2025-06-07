// contract with a struct containing multiple Strings and String?
struct Texts {
    title: String;
    body: String;
    footer: String?;
    author: String?;
}

contract StringTestContract {
    content: Texts;

    init() {
        self.content = Texts{
            title: "T",
            body: "B",
            footer: null,
            author: null
        };
    }
}
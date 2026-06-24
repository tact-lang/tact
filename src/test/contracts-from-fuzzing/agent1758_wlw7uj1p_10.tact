struct Text {
    content: String;
    title: String;
    subtitle: String?;
    tag: String;
}

contract StorageTest {
    text: Text;

    init() {
        self.text = Text{
            content: "main",
            title: "header",
            subtitle: null,
            tag: "taggy"
        };
    }
}
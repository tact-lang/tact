struct Blob {
    text: String?;
}

struct Container {
    blob: Blob;
}

contract OptionalLargeStringInStruct {
    data: Container;

    init() {
        self.data = Container{
            blob: Blob{
                text: "A very large text string with emojis 😊🚀 and international characters: 你好, мир, hello"
            }
        };
    }
}

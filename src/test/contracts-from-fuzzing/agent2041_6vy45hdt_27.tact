struct Layer {
    foo: Int?;
    bar: Bool;
    baz: String?;
}

struct Envelope {
    inner: Layer;
    note: String;
}

contract OptionalEnvelope {
    content: Envelope;
    init() {
        self.content = Envelope{
            inner: Layer{ foo: null, bar: true, baz: null },
            note: "done"
        };
    }
}
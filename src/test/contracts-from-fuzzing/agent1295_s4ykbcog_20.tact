// test persistent field with optional message struct
message(0x99) Notification {
    title: String;
    body: String?;
}

contract NotifyTest {
    notify: Notification?;

    init() {
        self.notify = Notification{
            title: "Hello",
            body: null
        };
    }
}
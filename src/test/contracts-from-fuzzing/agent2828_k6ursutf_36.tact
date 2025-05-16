struct Comment {
    text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
}

contract LargeStringField {
    comment: Comment;

    init() {
        self.comment = Comment{};
    }
}
struct User {
    id: Int;
    name: String;
}

struct Post {
    author: User;
    content: String;
    deleted: Bool;
}

contract SocialSeq {
    p1: Post;
    p2: Post;

    init() {
        self.p1 = Post{
            author: User{id: 1, name: "Bob"},
            content: "Hi",
            deleted: false
        };
        self.p2 = Post{
            author: User{id:2, name: "Alice"},
            content: "Hello",
            deleted: true
        };
    }
}

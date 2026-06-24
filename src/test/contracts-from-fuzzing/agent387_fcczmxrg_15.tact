struct Bottom {
    id: Int;
    label: String? = "lbl";
}

struct Mid {
    flag: Bool = false;
    b: Bottom;
}

struct Top {
    mid: Mid;
    tag: String?;
}

contract DeepCompactInit {
    field: Top = Top{
        mid: Mid{
            // omit flag (default false implicit)
            b: Bottom{
                id: 1
                // omit label (default "lbl")
            }
        }
        // omit tag (null default implicit)
    };
}
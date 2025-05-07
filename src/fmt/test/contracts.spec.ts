import { intact } from "@/fmt/test/helpers";

describe("contracts formatting", () => {
    it(
        "should format contract init function with as types",
        intact(
            `
                contract Foo {
                    init(val: Int as coins) {}
                }
            `,
        ),
    );
    it(
        "should format contract init function with as types 2",
        intact(
            `
                contract Foo {
                    init(
                        val: Int as coins,
                        other: Slice as bytes64,
                        mapping: map<Int as uint8, Address>,
                    ) {}
                }
            `,
        ),
    );
});

import {test} from "@/fmt/test/helpers"

describe("ignore directive for statements", () => {
    it("ignore let statement", test(`
        fun foo() {
            // fmt-ignore
            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            // fmt-ignore
            let   a =
                100;

            let b = 100;
        }
    `))

    it("ignore let statement with comment", test(`
        fun foo() {
            // fmt-ignore just for fun
            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            // fmt-ignore just for fun
            let   a =
                100;

            let b = 100;
        }
    `))

    it("ignore let statement without leading space", test(`
        fun foo() {
            //fmt-ignore
            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            //fmt-ignore
            let   a =
                100;

            let b = 100;
        }
    `))

    it("ignore let statement with other comment after directive", test(`
        fun foo() {
            // fmt-ignore
            // why? idk
            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            // fmt-ignore
            // why? idk
            let   a =
                100;

            let b = 100;
        }
    `))

    it("ignore let statement with extra newline after directive", test(`
        fun foo() {
            // fmt-ignore

            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            // fmt-ignore

            let a = 100;

            let b = 100;
        }
    `))

    it("ignore let statement with block comment", test(`
        fun foo() {
            /* fmt-ignore */
            let   a =
                100;

            let   b    = 100;
        }
    `, `
        fun foo() {
            /* fmt-ignore */
            let   a =
                100;

            let b = 100;
        }
    `))

    it("ignore if statement", test(`
        fun foo() {
            // fmt-ignore
            if (foo) {
                    aaa =    10
                    + 1;

            }


             else  {
                if (  true   ) {}
                    }

            let   b    = 100;
        }
    `, `
        fun foo() {
            // fmt-ignore
            if (foo) {
                    aaa =    10
                    + 1;

            }


             else  {
                if (  true   ) {}
                    }

            let b = 100;
        }
    `))
})

describe("ignore directive for top levels", () => {
    it("ignore function", test(`
        // fmt-ignore
        fun foo() {
            let   a =
                100;

            let   b    = 100;
        }

        fun    bar ()  {  return 10; }
    `, `
        // fmt-ignore
        fun foo() {
            let   a =
                100;

            let   b    = 100;
        }

        fun bar() {
            return 10;
        }
    `))

    it("ignore function with /// comment", test(`
        /// some doc
        /// fmt-ignore
        fun foo() {
            let   a =
                100;

            let   b    = 100;
        }

        fun    bar ()  {  return 10; }
    `, `
        /// some doc
        /// fmt-ignore
        fun foo() {
            let   a =
                100;

            let   b    = 100;
        }

        fun bar() {
            return 10;
        }
    `))
})

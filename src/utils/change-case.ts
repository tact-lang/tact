// The MIT License (MIT)
//
// Copyright (c) 2014 Blake Embrey (hello@blakeembrey.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// Regexps involved with splitting words in various case formats.
const SPLIT_LOWER_UPPER_RE = /([\p{Ll}\d])(\p{Lu})/gu;
const SPLIT_UPPER_UPPER_RE = /(\p{Lu})([\p{Lu}][\p{Ll}])/gu;

// Used to iterate over the initial split result and separate numbers.
const SPLIT_SEPARATE_NUMBER_RE = /(\d)\p{Ll}|(\p{L})\d/u;

// Regexp involved with stripping non-word characters from the result.
const DEFAULT_STRIP_REGEXP = /[^\p{L}\d]+/giu;

// The replacement value for splits.
const SPLIT_REPLACE_VALUE = "$1\0$2";

// The default characters to keep after transforming case.
const DEFAULT_PREFIX_SUFFIX_CHARACTERS = "";

/**
 * Supported locale values. Use `false` to ignore locale.
 * Defaults to `undefined`, which uses the host environment.
 */
type Locale = string[] | string | false | undefined;

/**
 * Options used for converting strings to pascal/camel case.
 */
interface PascalCaseOptions extends Options {
    mergeAmbiguousCharacters?: boolean;
}

/**
 * Options used for converting strings to any case.
 */
interface Options {
    locale?: Locale;
    split?: (value: string) => string[];
    /** @deprecated Pass `split: splitSeparateNumbers` instead. */
    separateNumbers?: boolean;
    delimiter?: string;
    prefixCharacters?: string;
    suffixCharacters?: string;
}

/**
 * Split any cased input strings into an array of words.
 */
function split(value: string) {
    let result = value.trim();

    result = result
        .replace(SPLIT_LOWER_UPPER_RE, SPLIT_REPLACE_VALUE)
        .replace(SPLIT_UPPER_UPPER_RE, SPLIT_REPLACE_VALUE);

    result = result.replace(DEFAULT_STRIP_REGEXP, "\0");

    let start = 0;
    let end = result.length;

    // Trim the delimiter from around the output string.
    while (result.charAt(start) === "\0") start++;
    if (start === end) return [];
    while (result.charAt(end - 1) === "\0") end--;

    return result.slice(start, end).split(/\0/g);
}

/**
 * Split the input string into an array of words, separating numbers.
 */
function splitSeparateNumbers(value: string) {
    const words = split(value);
    for (let i = 0; i < words.length; i++) {
        const word = words[i];
        if (typeof word === "undefined") continue;
        const match = SPLIT_SEPARATE_NUMBER_RE.exec(word);
        if (match) {
            const elem = match.at(1) ?? match[2];
            if (typeof elem !== "undefined") {
                const offset = match.index + elem.length;
                words.splice(i, 1, word.slice(0, offset), word.slice(offset));
            }
        }
    }
    return words;
}

/**
 * Convert a string to space separated lower case (`foo bar`).
 */
function noCase(input: string, options?: Options) {
    const [prefix, words, suffix] = splitPrefixSuffix(input, options);
    return (
        prefix +
        words
            .map(lowerFactory(options?.locale))
            .join(options?.delimiter ?? " ") +
        suffix
    );
}

/**
 * Convert a string to pascal case (`FooBar`).
 */
export function pascalCase(input: string, options?: PascalCaseOptions) {
    const [prefix, words, suffix] = splitPrefixSuffix(input, options);
    const lower = lowerFactory(options?.locale);
    const upper = upperFactory(options?.locale);
    const transform = options?.mergeAmbiguousCharacters
        ? capitalCaseTransformFactory(lower, upper)
        : pascalCaseTransformFactory(lower, upper);
    return (
        prefix + words.map(transform).join(options?.delimiter ?? "") + suffix
    );
}

/**
 * Convert a string to snake case (`foo_bar`).
 */
export function snakeCase(input: string, options?: Options) {
    return noCase(input, { delimiter: "_", ...options });
}

function lowerFactory(locale: Locale): (input: string) => string {
    return locale === false
        ? (input: string) => input.toLowerCase()
        : (input: string) => input.toLocaleLowerCase(locale);
}

function upperFactory(locale: Locale): (input: string) => string {
    return locale === false
        ? (input: string) => input.toUpperCase()
        : (input: string) => input.toLocaleUpperCase(locale);
}

function capitalCaseTransformFactory(
    lower: (input: string) => string,
    upper: (input: string) => string,
) {
    return (word: string) => `${upper(word.at(0) ?? '')}${lower(word.slice(1))}`;
}

function pascalCaseTransformFactory(
    lower: (input: string) => string,
    upper: (input: string) => string,
) {
    return (word: string, index: number) => {
        const char0 = word.at(0);
        if (typeof char0 === "undefined") return word;

        const initial =
            index > 0 && char0 >= "0" && char0 <= "9"
                ? "_" + char0
                : upper(char0);
        return initial + lower(word.slice(1));
    };
}

function splitPrefixSuffix(
    input: string,
    options: Options = {},
): [string, string[], string] {
    const splitFn =
        options.split ??
        (options.separateNumbers ? splitSeparateNumbers : split);
    const prefixCharacters =
        options.prefixCharacters ?? DEFAULT_PREFIX_SUFFIX_CHARACTERS;
    const suffixCharacters =
        options.suffixCharacters ?? DEFAULT_PREFIX_SUFFIX_CHARACTERS;
    let prefixIndex = 0;
    let suffixIndex = input.length;

    while (prefixIndex < input.length) {
        const char = input.charAt(prefixIndex);
        if (!prefixCharacters.includes(char)) break;
        prefixIndex++;
    }

    while (suffixIndex > prefixIndex) {
        const index = suffixIndex - 1;
        const char = input.charAt(index);
        if (!suffixCharacters.includes(char)) break;
        suffixIndex = index;
    }

    return [
        input.slice(0, prefixIndex),
        splitFn(input.slice(prefixIndex, suffixIndex)),
        input.slice(suffixIndex),
    ];
}

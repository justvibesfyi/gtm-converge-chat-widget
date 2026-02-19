# Converge Chat Widget - Google Tag Manager Template

Add the Converge live chat widget to your website using Google Tag Manager.

## What is Converge?

[Converge](https://useconverge.app) is a unified customer communication platform that aggregates messages from multiple channels into one inbox:

- Telegram
- WhatsApp
- Facebook Messenger
- Discord
- Zalo
- Gmail
- Website Chat Widget

## Installation

### Option 1: Community Template Gallery (Recommended)

1. Open Google Tag Manager and select your container
2. Go to **Templates** in the left sidebar
3. Click **Search Gallery** in the Tag Templates section
4. Search for "Converge Chat Widget"
5. Click **Add to workspace**
6. Create a new tag using this template
7. Enter your API Key from your Converge dashboard
8. Set trigger to "All Pages" or your preferred pages
9. Save and publish

### Option 2: Manual Import

1. Download `template.tpl` from this repository
2. In Google Tag Manager, go to **Templates**
3. Click **New** in the Tag Templates section
4. Click the three-dot menu and select **Import**
5. Select the downloaded `template.tpl` file
6. Save the template
7. Create a new tag using this template

## Configuration

| Field | Required | Description |
|-------|----------|-------------|
| API Key | Yes | Your Converge API Key from Settings > Widget |

## Finding Your API Key

1. Log in to your [Converge dashboard](https://useconverge.app)
2. Go to **Settings** > **Widget**
3. Copy your API Key

## Recommended Trigger

For most use cases, set the trigger to **All Pages** to show the chat widget on every page.

If you want to show the widget only on specific pages, create a custom trigger based on Page Path or other conditions.

## Support

- Documentation: https://useconverge.app/docs
- Support: support@useconverge.app
- Issues: https://github.com/converge/gtm-template/issues

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.

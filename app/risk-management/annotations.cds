using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Priority',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Risk Overview}',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Risk Details}',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Mitigation Overview}',
            ID : 'MitigationDetails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Mitigation Details}',
                    ID : 'MitigationDetails1',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigation}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@Communication.Contact#contact',
            Label : '{i18n>Contact Name}',
        },
    ],
    UI.SelectionFields : [
        prio_code,
        title,
        owner,
    ],
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://alert',
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    },
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@Communication.Contact#contact2',
                Label : '{i18n>ContactName}',
            },
        ],
    },
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : 'Mitigation',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'Timeline',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'Owner',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : 'Text Property',
            },
        ],
    },
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
    Communication.Contact #contact2 : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
);

annotate service.Risks with {
    miti @(
        Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Risks',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
        ],
        Label : '{i18n>Mitigation}',
    },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Risks with {
    prio @(
        Common.Label : '{i18n>Priority}',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Risks with {
    title @Common.Label : '{i18n>Title}'
};

annotate service.Risks with {
    owner @Common.Label : '{i18n>Owner}'
};

annotate service.Risks with {
    ID @Common.Text : descr
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : BusinessPartner,
    },
);

